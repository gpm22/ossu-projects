# Analysis and Evaluation of the Sharing App

## Explanation

This activity is about using the **ATAM Process** to analyze and evaluate the Sharing App system.

It is needed to create a tree diagram and explanations using the provided **Attribute Utility Tree** and **Quality Attribute Scenarios** according to the following rules:

1. For each Quality Attribute Scenario provided, identify if it is a **risk**, **non-risk**, **trade-off**, or **sensitivity point** in the applications architecture and give a brief explanation for each.
2. Once the evaluation is finished, **update** the Utility Tree to reflect the Scenarios.
   * You should be able to make 4-5 changes, including adding a Quality Attribute and adding more Attribute Refinements and ASRs to reflect the risks.
   * You may also update the current ASRs to reflect the Scenarios or (if justified in the evaluation) change their priorities.

### Attribute Utility Tree of the current state of the system

![Attribute_Utility_Tree](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Software%20Architecture/Analysis%20and%20Evaluation%20of%20the%20Sharing%20App/Initial_Attribute_Utility_Tree.png)

### Quality Attribute Scenarios

```
    ------------   Stimulus:     --------------     Response     ----------------
1 - |  Source: | --------------> |  Artifact  | ---------------> |   Response   |
    | End user |   User clicks   | Mobile App |  List of other   |   Measure:   |
    ------------    on Search    --------------   users' items   | Time to load |
                                  Environment:    is displayed   | items from   |
                                   Heavy load                    | from remote  |
                                                                 | database     |
                                                                 ----------------

    ------------   Stimulus:     --------------     Response     ----------------
2 - |  Source: | --------------> |  Artifact  | ---------------> |   Response   |
    | End user |  User creates   | Mobile App | New Account is   |   Measure:   |
    ------------  and account    | or Web App | created, app     | Time for     |
                  using a        -------------- goes to home     | account to   |
                  username and    Environment:  page             | be stored    |
                  email              Normal                      | externally   |
                                  opperations                    ----------------
                                                                 
    ------------   Stimulus:     --------------     Response     ----------------
3 - |  Source: | --------------> |  Artifact  | ---------------> |   Response   |
    | End user |  User logs in   | Mobile App |   app goes to    |   Measure:   |
    ------------  with username  | or Web App |    home page     | Time for     | 
                                 --------------                  | account to   |
                                  Environment:                   | be loaded    |
                                     Normal                      | externally   |
                                  opperations                    ----------------

    ------------   Stimulus:     --------------     Response     ----------------
4 - |  Source: | --------------> |  Artifact  | ---------------> |   Response   |
    | End user |  User tries to  | Mobile App |  Error message   |   Measure:   |
    ------------  create an item --------------  is displayed    | Time taken   | 
                  with an empty   Environment:                   | to validate  |
                  field              Normal                      | input        |
                                  opperations                    ----------------
                                  
    ------------   Stimulus:     ------------     Response     ----------------
5 - |  Source: | --------------> | Artifact | ---------------> |   Response   |
    | End user |  User adds a    | Web App  |  Confirmation    |   Measure:   |
    ------------  valid item to  ------------   message is     | Time taken   |
                  their items     Environment:   displayed     | for server   |
                                     Normal                    | to save item |
                                  opperations                  | and send     |
                                                               | confirmation |
                                                               | message      |
                                                               ----------------

    ------------   Stimulus:     --------------     Response     ----------------
6 - |  Source: | --------------> |  Artifact  | ---------------> |   Response   |
    | External |  changes are    | Web Server |  Updated changes |   Measure:   |
    | Systems  |  made to the    --------------  are pushed to   | Time taken   | 
    ------------  data being      Environment:   the apps        | for changes  |
                  used               Normal                      | to be sent   |
                                  opperations                    ----------------

    ------------   Stimulus:     --------------     Response     ----------------
7 - |  Source: | --------------> |  Artifact  | ---------------> |   Response   |
    | End user |  two users are  | Mobile App | Finishing        |   Measure:   |
    ------------  attempting to  | or Web App | processing first | Time taken   | 
                  make changes   -------------- request, then    | for changes  |
                  to the same    Environment:   updated changes  | to be sent   |
                  data            Processing    which are pushed ----------------
                                  multiples     to the apps. Next
                                  requests      request can be processed provided
                                                it doesn't lead to inconsistencies


```

## Final Result

### Quality Attribute Scenarios Evaluation

#### Scenario 1

* It is a  **risk** scenario.
* As it does request to database in a **heavy load environment**, which can be **slow**.
* Must be prioritized highly.

#### Scenario 2

* It is a **non-risk**.
* As it is in a **normal operations environment** and does nothing risky.

#### Scenario 3

* It is a **non-risk**.
* As it is in a **normal operations environment** and does nothing risky.

#### Scenario 4

* It is a **non-risk**.
* As it is in a **normal operations environment** and does nothing risky.

#### Scenario 5

* It is a **non-risk**.
* As it is in a **normal operations environment** and does nothing risky.

#### Scenario 6

* It is a **non-risk**.
* As it is in a **normal operations environment** and does nothing risky.

#### Scenario 7

* It is a **risk** scenario.
* As it can only processes one request at a time to changes to the same data.
* So it can cause some inconveniences to users, as someone's changes maybe not be made.
* Must be **prioritized highly**.

### Updated Attribute Utility Tree

![Final_Attribute_Utility_Tree](https://raw.githubusercontent.com/gpm22/ossu-projects/main/Software%20Architecture/Analysis%20and%20Evaluation%20of%20the%20Sharing%20App/Final_Attribute_Utility_Tree.png)
