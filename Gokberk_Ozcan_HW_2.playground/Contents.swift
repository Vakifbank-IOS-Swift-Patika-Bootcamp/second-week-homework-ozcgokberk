import Foundation

protocol CompanyProtocol {
    func addEmployee(emp: Employee?) -> [Employee?]
    func paySalary(closure: () -> Void) -> Double
    func companyExpense(expense: Double) -> Double
    func addIncome(income: Double) -> Double
}

protocol EmployeeProtocol {
    func calculateSalary(_ experience: TypeOfEmployee) -> Double
}

enum MaritalStatus {
    case single
    case married
    
    var descripton: String {
        switch self {
        case .single:
            return "single"
        case .married:
            return "married"
        }
    }
}

enum TypeOfEmployee: Int {
    case junior = 1
    case mid = 2
    case senior = 3
}


class Company : CompanyProtocol {
    
    let companyName: String = "Apple"
    var foundationYear: Int = 1998
    var budget: Double = 100000.0
    var employee: Employee?
    var employeeList: [Employee] = []
    
    func addIncome(income: Double) -> Double {
        
        budget += income
        return budget
    }
    
    func companyExpense(expense: Double) -> Double {
        budget -= expense
        return budget
    }
    
    func addEmployee(emp: Employee?) -> [Employee?] {
        
        for  employee in [emp] {
            employeeList.append(employee!)
        }
        return employeeList
    }
    
    func paySalary(closure: () -> Void) -> Double {
        
        var newBudget: Double = 0.0
        for i in employeeList {
            newBudget = budget - i.baseSalary
        }
        closure()
        return newBudget
    }
    
}

class Employee : Company {
    
    var name: String = ""
    var age: Int = 0
    var maritalStatus: MaritalStatus?
    var baseSalary: Double = 5000.0
    var experience: TypeOfEmployee?
    
    init(name: String, age: Int,maritalStatus: MaritalStatus?, experience: TypeOfEmployee?) {
        
        self.name = name
        self.age = age
        self.maritalStatus = maritalStatus
        self.experience = experience
    }
    
    func calculateSalary(_ experience: TypeOfEmployee) -> Double {
        switch experience {
            
        case .junior:
            baseSalary = baseSalary * Double(TypeOfEmployee.junior.rawValue) + 1500
            return baseSalary
            
        case .mid:
            baseSalary = baseSalary * Double(TypeOfEmployee.mid.rawValue) + 3000
            return baseSalary
            
        case .senior:
            baseSalary = baseSalary * Double(TypeOfEmployee.senior.rawValue) + 5000
            return baseSalary
        }
    }
    
    
}
var company = Company()
company.addIncome(income: 10000.0)
company.companyExpense(expense: 50000.0)
print("New budget after the income and expense balance is calculated:  \(company.budget)")
company.addEmployee(emp: Employee(name: "Gökberk", age: 24, maritalStatus: .single, experience: .junior))
company.employeeList[0].maritalStatus?.descripton
company.employeeList[0].age
company.employeeList[0].calculateSalary(company.employeeList[0].experience!)
company.employeeList
company.paySalary {
    print("You can do whatever you want here.")
}


