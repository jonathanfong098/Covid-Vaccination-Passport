//
//  UserModel.swift
//  CovidVaccinationPassport
//
//  Created by Jonathan Fong on 5/1/21.
//

import Foundation

struct UserViewModel {
    var email: String = ""
    var password: String = ""
    var confirm_password: String = ""
    var first_name: String = ""
    var last_name: String = ""
    
    //check is passwords are the same
    func password_match(new_confirm_password: String) -> Bool {
        if new_confirm_password == password{
            return true
        } else {
            return false
        }
    }
    
    //check if fields have text in them
    func is_empty(field: String) -> Bool {
        return field.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    //check if email is valid
    func valid_email(new_email: String) -> Bool {
        // Password must be 8 chars, contain a capital letter and a number
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return passwordTest.evaluate(with: email)
    }
    
    //checl if password is valid
    func valid_password(new_password: String) -> Bool {
        // Password must be 8 chars, contain a capital letter and a number
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    //check if registered properly
    var register_complete: Bool {
        if is_empty(field: first_name) ||
           is_empty(field: last_name) ||
           valid_password(new_password: password) ||
           valid_email(new_email: email) ||
           password_match(new_confirm_password: confirm_password)
        {
            return false
        } else {
            return true
        }
    }
    
    //check if logged in properly
    var login_complete: Bool {
        if is_empty(field: email) ||
            is_empty(field: password)
        {
            return false
        } else {
            return true
        }
    }

    //validation string for first name
    var valid_first_name_message: String {
        if !is_empty(field: first_name) {
            return ""
        } else {
            return "Enter your first name."
        }
    }
    
    //validation string for last name
    var valid_last_name_message: String {
        if !is_empty(field: last_name) {
            return ""
        } else {
            return "Enter you last name."
        }
    }
    
    //validation string for email
    var valid_email_address_message:String {
        if valid_email(new_email: email){
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    //validation string for password
    var valid_password_message:String {
        if valid_password(new_password: password) {
            return ""
        } else {
            return "Must be 8 characters containing at least one number and one Capital letter."
        }
    }
    
    //validation matching password string
    var passwords_match_message: String {
        if password_match(new_confirm_password: confirm_password) {
            return ""
        } else {
            return "Password fields do not match."
        }
    }
    
}
