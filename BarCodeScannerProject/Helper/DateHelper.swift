//
//  DateHelper.swift
//  BarCodeScannerProject
//
//  Created by Satyam Singh on 10/07/24.
//

import Foundation

extension Date {
    var dayAndMonth: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: self)
    }
    
    var day: Int {
        return self.get(.day)
    }
    
    var month: Int {
        return self.get(.month)
    }
    
    var year: Int {
        return self.get(.year)
    }
    
    var hour: Int {
        return self.get(.hour)
    }
    
    var minute: Int {
        return self.get(.minute)
    }
    
    var completeDateString: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.string(from: self)
    }
    
    var standardDateString: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
    var endDateString: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
    /// Event Time
    /// - Parameters:
    ///   - hour: Hours in 24 hour format
    ///   - minute: Minutes
    /// - Returns: New Date with updated Hours and Minutes
    func eventTime(hour: Int, minute: Int) -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components) ?? Date()
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension Date {
    
    func weekday(using calendar: Calendar = .current) -> Int {
            calendar.component(.weekday, from: self)
        }
    
    var isSunday: Bool {
        let calendar = Calendar(identifier: .iso8601)
        return self.weekday(using: calendar) == 1
    }
    
    func date(withAddingDays days: Int) -> Date {
        var dateComponents = DateComponents()
        
        dateComponents.day = days
        
        return Calendar.current.date(byAdding: dateComponents, to: self) ?? Date()
    }
    
    func date(withAddingMinutes minutes: Int) -> Date {
        var dateComponents = DateComponents()
        
        dateComponents.minute = minutes
        
        return Calendar.current.date(byAdding: dateComponents, to: self) ?? Date()
    }
    
    var dayString: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    var monthAndYear: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
    var monthFirstLetter: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "E"
        return "\(dateFormatter.string(from: self).first ?? Character(""))"
    }
    
    static func today() -> Date {
        return Date()
    }
    
    func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.next,
                   weekday,
                   considerToday: considerToday)
    }
    
    func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.previous,
                   weekday,
                   considerToday: considerToday)
    }
    
    func get(_ direction: SearchDirection,
             _ weekDay: Weekday,
             considerToday consider: Bool = false) -> Date {
        
        let dayName = weekDay.rawValue
        
        let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }
        
        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")
        
        let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1
        
        let calendar = Calendar(identifier: .gregorian)
        
        if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
            return self
        }
        
        var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
        nextDateComponent.weekday = searchWeekdayIndex
        
        let date = calendar.nextDate(after: self,
                                     matching: nextDateComponent,
                                     matchingPolicy: .nextTime,
                                     direction: direction.calendarSearchDirection)
        
        return date!
    }
    
    var hourAndMinute: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self)
    }
    
    var hourAndMinute24: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    var isPresentDay: Bool {
        return self.year == Date().year &&
            self.month == Date().month &&
            self.day == Date().day
    }
    
    var startOfTheDay: Date {
        Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self) ?? Date()
    }
    
    var endOfTheDay: Date {
        Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: self) ?? Date()
    }
}

// MARK: Helper methods
extension Date {
    func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }
    
    enum Weekday: String {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }
    
    enum SearchDirection {
        case next
        case previous
        
        var calendarSearchDirection: Calendar.SearchDirection {
            switch self {
            case .next:
                return .forward
            case .previous:
                return .backward
            }
        }
    }
}


extension Date {
    // Function to format the date to "Month Day" format
    var formattedDateWithSuffix: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d'\(daySuffix(from: self))'"
        return dateFormatter.string(from: self)
    }
    
    // Function to add the appropriate suffix to the day (st, nd, rd, or th)
    func daySuffix(from date: Date) -> String {
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: date)
        
        switch dayOfMonth {
        case 1, 21, 31: return "st"
        case 2, 22: return "nd"
        case 3, 23: return "rd"
        default: return "th"
        }
    }
}

extension String {
    var completeDate: Date {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self) ?? Date()
    }
    
    var isValidCompleteDate: Bool {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self) != nil
    }
    
    var messageTimeString: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: date)
        } else {
            return "N/A"
        }
    }
    
    var convertStringToDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.date(from: self) ?? Date()
    }
}
