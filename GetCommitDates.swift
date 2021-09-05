#!/usr/bin/swift

import Foundation

var date: Date
var repo: String
var author: String

let arguments = CommandLine.arguments

let sinceArgIndex = arguments.firstIndex(of: "-since")!
let dateStr = arguments[sinceArgIndex + 1]
let a = dateStr.split(separator: ":")
date = Calendar.current.date(
    from: DateComponents(
        year: Int(a[2]),
        month: Int(a[1]),
        day: Int(a[0])
    )
)!

let authorArgIndex = arguments.firstIndex(of: "-author")!
author = arguments[authorArgIndex + 1]

let repoArgIndex = arguments.firstIndex(of: "-repo")!
repo = arguments[repoArgIndex + 1]

getAllCommitDates(
    since: date,
    in: repo,
    author: author
) { dates in
    print("Done")
    print(dates)
}

func getAllCommitDates(
    since sinceDate: Date,
    in repo: String,
    author: String,
    completion: @escaping ([Date]) -> Void
) {
    let dateFormatter = ISO8601DateFormatter()
    let dateString = dateFormatter.string(from: sinceDate)

    var urlComponents = URLComponents(string: "https://api.github.com/repos/\(author)/\(repo)/commits")!
    urlComponents.queryItems = [
        URLQueryItem(name: "accept", value: "application/vnd.github.v3+json"),
        URLQueryItem(name: "since", value: dateString),
        URLQueryItem(name: "per_page", value: "100"),
    ]
    let request = URLRequest(url: urlComponents.url!)

    let semaphore = DispatchSemaphore(value: 0)

    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print(error.localizedDescription)
            completion([])
            semaphore.signal()
            return
        }
        guard let data = data else {
            print("Empty data")
            completion([])
            semaphore.signal()
            return
        }

        do {
            let response = try JSONDecoder().decode([Responce].self, from: data)
            completion(
                response
                    .lazy
                    .map(\.commit.author.date)
                    .compactMap(dateFormatter.date(from:))
            )
            semaphore.signal()
        } catch (let e) {
            print("Error on parsing \(e.localizedDescription)")
            completion([])
            semaphore.signal()
        }
    }.resume()
    semaphore.wait()
}

struct Responce: Decodable {
    struct Commit: Decodable {
        struct Author: Decodable {
            let date: String
        }
        let author: Author
    }
    let commit: Commit
}
