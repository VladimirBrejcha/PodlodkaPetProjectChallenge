var bid: Int = 0
var membersWeeks: [Int] = []
var memberWeeks = 0
var freeBankMoney = 0

print("Enter a bid (must be a number):")
if let input = readLine(strippingNewline: true) {
    bid = Int(input)!
}

print("Enter freeBankMoney (must be a number):")
if let input = readLine(strippingNewline: true) {
    freeBankMoney = Int(input)!
}

print("Enter current member weeks (must be a number):")
if let input = readLine(strippingNewline: true) {
    memberWeeks = Int(input)!
    membersWeeks.append(Int(input)!)
}

while (true) {
    print("Enter other member weeks (must be a number)")
    print("Enter e to break")
    if let input = readLine(strippingNewline: true) {
        if let number = Int(input) {
            membersWeeks.append(number)
        } else if input == "e" {
            break
        } else {
            print("Error try again!")
        }
    } else {
        print("Error try again!")
    }
}

print("Calculating")

let result = calculateWin(
    bid: bid,
    freeBankMoney: freeBankMoney,
    membersWeeks: membersWeeks,
    memberWeeks: memberWeeks
)
print("result = \(result)")

func calculatePercentage(of value: Double, in totalValue: Double) -> Double {
    value / totalValue
}

func calculateWin(
    bid: Int,
    freeBankMoney: Int,
    membersWeeks: [Int],
    memberWeeks: Int
) -> Double {
    let membersWeeksReduced = membersWeeks.reduce(0, +)

    let percent = calculatePercentage(
        of: Double(memberWeeks),
        in: Double(membersWeeksReduced)
    )

    let bankMoney: Double = (Double(freeBankMoney) * Double(percent))

    let ownMoney: Double = Double(bid) * Double(memberWeeks)

    let result = bankMoney + ownMoney

    return result
}
