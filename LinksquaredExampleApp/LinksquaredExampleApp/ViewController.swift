//
//  ViewController.swift
//  LinksquaredExampleApp
//
//  Created by Dragos Dobrean on 03.09.2024.
//

import UIKit
import Linksquared

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        Linksquared.delegate = self
    }

    @IBAction func generateLink(_ sender: Any) {
        Linksquared.generateLink(title: "Hello", subtitle: "From linksquared", imageURL: nil, data: ["Hello": "From the other side"], tags: nil) { url in
            guard let url else {
                return
            }

            self.showShareSheetForURL(url: url)
        }
    }

    private func showShareSheetForURL(url: URL) {
        // Create an array containing the URL to share
        let itemsToShare = [url]

        // Initialize the UIActivityViewController with the items to share
        let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)

        // Exclude certain activity types if necessary (optional)
        activityViewController.excludedActivityTypes = [
            .assignToContact,
            .addToReadingList,
            .print
        ]

        // Present the share sheet
        present(activityViewController, animated: true, completion: nil)
    }

}

extension ViewController: LinksquaredDelegate {

    func linksquaredReceivedPayloadFromDeeplink(payload: [String : Any]) {
        // Set the payload to the label
        if let data = convertDictionaryToJSONString(payload) {
            dataLabel.text = "Received from deeplink: \(data)"
        }
    }
}

extension ViewController {
    func convertDictionaryToJSONString(_ dictionary: [String: Any]) -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            print("Error converting dictionary to JSON string: \(error.localizedDescription)")
            return nil
        }
    }
}
