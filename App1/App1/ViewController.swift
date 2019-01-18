//
//  ViewController.swift
//  App1
//
//  Created by Emily-Khine Chu on 9/24/18.
//  Copyright © 2018 Emily-Khine Chu. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var answeredCorrectNumLabel: UILabel!
    

    
    @IBOutlet weak var questionLabel: UILabel!
    var question = [Question]()
    var questionIndex = 0
    var numCorrect = 0
    var answeredCorrect = false 
    var indexPathRow = 0
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        getLocalJasonFile()
        displayLabel()
        self.tableView.tableFooterView = UIView()
        
      
    }
    func getLocalJasonFile() {
       
        let path = Bundle.main.path(forResource: "document", ofType: ".json")
        guard path != nil else {
            print("can't find json file")
            return
        }
       
        let url = URL(fileURLWithPath: path!)
        do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
            let array = try decoder.decode([Question].self, from: data)
            questionsRetrieved(questions: array)
            question = array
            tableView.reloadData()
        } catch {
            print ("can't create data object from file")
        }
            
    }
    
    func displayLabel() {
        guard questionIndex < question.count else {
            print("Trying to display a question index that is out of bounds")
            return
        }
        questionLabel.text = question[questionIndex].question!
        tableView.reloadData()
    }
    
    func questionsRetrieved(questions: [Question]) {
        self.question = questions
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard question.count > 0 && question[questionIndex].answer != nil else {
            return 0
        }
        return question[questionIndex].answer!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        cell?.backgroundColor = UIColor.clear
        let label = cell?.viewWithTag(1) as! UILabel
        label.text = question[questionIndex].answer![indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if question[questionIndex].correctAnswerIndex! == indexPath.row {
            numCorrect += 1
           answeredCorrectNumLabel.text = "Answer Correct: \(numCorrect)"
           tableView.reloadData()
        }
     
         if questionIndex < (question.count - 1){
        questionIndex += 1
        displayLabel()
    
         } else {
            performSegue(withIdentifier: "detailsegue", sender: numCorrect)
        }
}
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsegue"{
            if let nextViewController = segue.destination as? DetailViewController{
                nextViewController.num = numCorrect
            }
        }
    }
}
    
    





