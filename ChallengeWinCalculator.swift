var bid: Int = 0
var membersWeeks: [Int] = []
var memberWeeks = 0
var freeBankMoney = 0

print("Let's calculate how much money you can withdraw".green)

print("Enter a bid (must be a number):".yellow)
bid = readIntOrError()

print("Enter the number of free money in the bank (must be a number):".yellow)
freeBankMoney = readIntOrError()

print("Enter the number of active weeks of the current participant (must be a number):".yellow)
memberWeeks = readIntOrError()
membersWeeks.append(memberWeeks)

print("Now, for each still active participant, enter its number of active weeks".green)
print("Enter \"e\" to stop".green)

while (true) {
    print("Enter the number of active weeks of another active participant (must be a number)".yellow)
    let input = readLineOrError()
    if input == "e" {
        break
    } else if let number = Int(input) {
        membersWeeks.append(number)
    } else {
        print("Not a number, try again!".red)
    }
}

let result = calculateWin(
    bid: bid,
    freeBankMoney: freeBankMoney,
    membersWeeks: membersWeeks,
    memberWeeks: memberWeeks
)

print("You can withdraw \(result)".green)

func calculateWin(
    bid: Int,
    freeBankMoney: Int,
    membersWeeks: [Int],
    memberWeeks: Int
) -> Double {
    let membersWeeksReduced = membersWeeks.reduce(0, +)
    let percent = Double(memberWeeks) / Double(membersWeeksReduced)
    let bankMoney: Double = (Double(freeBankMoney) * percent)
    let ownMoney: Double = Double(bid) * Double(memberWeeks)
    return bankMoney + ownMoney
}

func readLineOrError() -> String {
    if let input = readLine(strippingNewline: true) {
        return input
    } else {
        print("Try again!".red)
        return readLineOrError()
    }
}

func readIntOrError() -> Int {
    let input = readLineOrError()
    if let number = Int(input) {
        return number
    } else {
        print("Not a number, try again!".red)
        return readIntOrError()
    }
}

extension String {
    var green: String {
        "\u{001B}[0;32m\(self)"
    }

    var yellow: String {
        "\u{001B}[0;33m\(self)"
    }

    var red: String {
        "\u{001B}[0;31m\(self)"
    }
}
