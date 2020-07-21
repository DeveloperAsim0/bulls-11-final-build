//
//  model.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 22/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import Foundation

class model{
    static var totalSlots = [String]()
    static var actualDateID = String()
    static var firstoption          = [String]()
    static var secondoption         = [String]()
    static var thirdoption          = [String]()
    static var fourthoption         = [String]()
    static var rightans             = [String]()
    static var chooseans            = String()
    static var id                   = [String]()
    static var value                = Int()
    static var bullsPoint           = String()
    static var ques                 = [String]()
    static var choose_Answer        = [String]()
    static var chooseoption         = Int()
    static var firsttext            = [String]()
    static var secondtext           = [String]()
    static var thirdtext            = [String]()
    static var fourthtext           = [String]()
    static var date                 = [String]()
    static var dateListStatus       = [Bool]()
    static var dateID               = [String]()
    static var date_details         = [String]()
    static var CoreDiff             = [String]()
    static var TopTenCore           = [String]()
    static var NonCoreDiff          = [String]()
    static var TopNonCore           = [String]()
    static var final_Batsman        = [String]()
    static var final_Bowler         = [String]()
    static var final_wicket_keeper  = [String]()
    
}


class batsmanTeam {
    static var Company_Details = [String]()
    static var Company_ID      = [String]()
    static var Company_Name    = [String]()
    static var Company_Type    = [String]()
}

class bowlerTeam {
    static var Company_Details = [String]()
    static var Company_ID      = [String]()
    static var Company_Name    = [String]()
    static var Company_Type    = [String]()
}

class wicketkeeparTeam {
    static var Company_Details = [String]()
    static var Company_ID      = [String]()
    static var Company_Name    = [String]()
    static var Company_Type    = [String]()
}

class allrounderTeam {
    static var Company_Details               = [String]()
    static var Company_ID                    = [String]()
    static var Company_Name_Batsman_Core     = [String]()
    static var Company_Name_Batsman_NonCore  = [String]()
    static var Company_Name_Bowler           = [String]()
    static var Company_Name_Wicket_Keeper    = [String]()
    static var Company_Type                  = [String]()
    static var BowlerCompID                  = [String]()
    static var wicketkeeperID                = [String]()
    
}

class savedBatsmanTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}

class savedBowlerTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}

class savedAllRounderTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}

class savedWicketKeeperTeams {
    static var CompanyID   = [String]()
    static var CompanyName = [String]()
}
