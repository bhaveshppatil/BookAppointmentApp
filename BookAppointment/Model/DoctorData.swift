//
//  DoctorData.swift
//  BookAppointment
//
//  Created by Perennial Macbook on 30/08/22.
//

import Foundation
class DoctorData {
    static func getDoctorList() -> [DoctorModel] {
        let data = [
            DoctorModel(name: "Dr Aabha Nagral", speciality: "MBBS, MD - Obstetrics & Gynaecology", rating: "4.5", image: "doctor1", workExp: "25+", totalPatient: "538+", reviews: "234+", about: "Senior Obstetrician, Gynaecologist & Infertility Specialist with 22 years of experience.A Well Renowned Obstetrician who is highly experienced in dealing with High Risk Pregnancies & who is well reputed for facilitating & encouraging Normal deliveries", date: DateData(dateText: ["5", "6", "7", "8","9","10","11"]), day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]), hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"])),
            
            DoctorModel(name: "Dr. Parthasarathi Dutta Roy", speciality: "Dermatologist, Cosmetologist, Hair Transplant Surgeon", rating: "4.6", image: "doctor3",  workExp: "19+", totalPatient: "58+", reviews: "24+", about: "Dr. Parthasarathi Dutta Roy Is Dermatologist in Bangalore- is dedicated to the field of Dermatology, Cosmetology, Trichology and Aesthetic Treatments. Under his able guidance and sharp observations, we never compromise with the quality of treatment and patients’ safety.", date: DateData(dateText: ["15", "16", "17", "18","19","20","21"]) , day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]), hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"])),
            
            DoctorModel(name: "Dr. H S Chandrika", speciality: "Fellowship in Corneal Transplant surgeries, Refractive Surgery and Ocular Surface diseases", rating: "4.5", image: "doctor4",  workExp: "16+", totalPatient: "458+", reviews: "354+", about: "Dr. H.S. Chandrika is a Consultant Gynaecologist at Dr. Malathi Manipal Hospital, Bangalore. She is an expert in prenatal care, pregnancy management and treatment of womens reproductive conditions.", date: DateData(dateText: ["12", "14", "16", "18","20","22","24"]), day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]), hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"])),
            
            DoctorModel(name: "Dr. Sankeerth Vijayakumar", speciality: "Dermatologist, Aesthetic Dermatologist, Cosmetologist", rating: "4.8", image: "doctor5", workExp: "12+", totalPatient: "438+", reviews: "344+", about: "Dr. Sankeerth Vijayakumar is a Consultant Dermatologist and a Cosmetologist. He has obtained his MBBS degree from Kempegowda Institute of Medical Sciences, Bangalore and post graduate MD degree in Dermatology, Venereology & Leprosy from S.S Institute of Medical Sciences, Davangere",date: DateData(dateText: ["9", "13", "17", "21","25","27","30"]), day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]), hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"])),
            
            DoctorModel(name: "Dr. Archana Agarwal", speciality: "MBBS, DGO, Infertility Specialist, Gynecologist, Obstetrician", rating: "4.3", image: "doctor6", workExp: "21+", totalPatient: "238+", reviews: "145+", about: "Dr. Archana Agarwal is an infertility specialist, gynecologist and reproductive endocrinologist (infertility) in Marathahalli, Bangalore and has an experience of 21 years in these fields. Dr. Archana Agarwal practices at Mannat Fertility Clinic in Marathahalli, Bangalore. ", date: DateData(dateText: ["5", "6", "7", "8","9","10","11"]) , day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]),hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"])),
            
            DoctorModel(name: "Dr. Kisalay Saurav", speciality: "Dermatologist, Cosmetologist, Aesthetic Dermatologist, Trichologist, Venereologist, Hair Transplant Surgeon", rating: "4.7", image: "doctor7", workExp: "17+", totalPatient: "738+", reviews: "456+", about: "Dr. Kisalay Saurav did his MD in Dermatology from KMC, Manipal after which he worked with CMC (Christian Medical College) Vellore, as a Consultant in the Department of Dermatology. He came to Bangalore in the year 2010 and got associated with The Apollo Group and St. Philomena’s Hospital.", date: DateData(dateText: ["5", "6", "7", "8","9","10","11"]), day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]), hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"])),
            
            DoctorModel(name: "Dr. H S Chandrika", speciality: "Fellowship in Corneal Transplant surgeries, Refractive Surgery and Ocular Surface diseases", rating: "4.5", image: "doctor4",  workExp: "16+", totalPatient: "458+", reviews: "354+", about: "Dr. H.S. Chandrika is a Consultant Gynaecologist at Dr. Malathi Manipal Hospital, Bangalore. She is an expert in prenatal care, pregnancy management and treatment of womens reproductive conditions.", date: DateData(dateText: ["5", "6", "7", "8","9","10","11"]) , day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]), hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"])),
            
            DoctorModel(name: "Dr. Sankeerth Vijayakumar", speciality: "Dermatologist, Aesthetic Dermatologist, Cosmetologist", rating: "4.8", image: "doctor5", workExp: "12+", totalPatient: "438+", reviews: "344+", about: "Dr. Sankeerth Vijayakumar is a Consultant Dermatologist and a Cosmetologist. He has obtained his MBBS degree from Kempegowda Institute of Medical Sciences, Bangalore and post graduate MD degree in Dermatology, Venereology & Leprosy from S.S Institute of Medical Sciences, Davangere", date: DateData(dateText: ["5", "6", "7", "8","9","10","11"]), day: DaysData(dayText: ["sun","mon","tue","wed", "thu", "fri","sat"]), hours: VisitHour(hour: ["10:15AM", "12:30PM", "02:30PM", "04:15PM", "05:00PM", "06:00Pm", "7:30PM"]))
            
        ]
        return data
    }
}
