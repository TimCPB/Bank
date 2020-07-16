# Bank (Tech Challenge #1)

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Initial Approach

- My first step was to translate the requirements above into user stories to help me conceptualise how a user would interact with the program
- I then tried to extract the classes, data and actions (methods) from the requirements and user stories and used them to create an initial model, shown below
- Finally, I added some arrows to the diagram to try and establish how the classes might interact

## User stories (based on the requirements)

```
As a customer
So I can manage my money
I want to be abel to open an account at the bank
```
```
As a customer
So I can store my money
I want to be able to deposit money into my account
```
```
As a customer
So I can spend my money
I want to be able to withdraw money from my account
```
```
As a customer
So I can see a record of my account
I want to be able to print a statement of my account transactions
```
```
As a customer
So I can keep track of my finances
I want a statement that includes dates and balances from each transaction
```


## Initial Program Model

<p align="center">
<img src=/images/domain_model_for_bank_challenge.png width=80%>
</p> 

## Code Structure

- I revised the above model as I progressed through the challenge. Ultimately I decided on three classes: Account, Transaction and Statement
- I tried to structure the code so that a user would only ever have to interact with the Account class
- They can open an account, then within that account they can make deposits and withdrawls, and they can print a statement
- When they make a deposit or a withdrawl an instance of the Transaction class is created and stored in an array as part of the @transaction_history array, all within the account class
- When they print a statement, an instance of the Statement class is created and the @transaction_history array is passed to it as an argument. The Statement class contains a 'generate_statement' method, which is then called on this instance of Statement and the account's 'print_statement" method outputs the result.

## Revised Program Model

<p align="center">
<img src=images/2nd_domain_model_for_bank_challenge.png width=80%>
</p> 

## Irb User Interaction Screenshot

<p align="center">
<img src=images/irb_user_interaction.png width=80%>
</p>

## Irb Printed Statement Sreenshot

<p align="center">
<img src=images/statement.png width=80%>
</p>

## Areas for Improvement

- The Account class is very long and handles quite a lot of logic. Many of the methods could be simplified further and don't fully comply with the SRP principle. Extracting more of the logic into additional methods is one option but perhaps an additional class is required
- Some methods in the Statement class could also be separated out to be more SRP compliant
- The structure of the 'Describe...' blocks within my spec files could be improved. It could be more consistent to make it more readable
 - EG Better use of 'context' blocks and the syntax used in mocking could also be more consistent
- Some of the formatting that occurs upon initialization in the Transaction class could be separated out into private methods
- Several methods just modify instance variables

## Post-feedback Adjustments

- The unit tests in account_spec.rb are now better isolated. I had been too concerned about DRY-ing out the tests and as such had extracted some of the conditions from several tests into a context block, meaning those tests couldn't be run in isolation. I now realise test isolation is more important and that keeping code DRY is not such a priority in tests
- I refactored the `print_statement` method in account.rb to make it less 'stateful' and easier to change going forward
  - it went from:
 ```
   def print_statement
    create_statement
    puts @statement
  end
  
  private
  
  def create_statement
    @statement = Statement.new(@transaction_history).generate_statement
  end
  ```
   to this:
  ```
    def print_statement
    puts statement
  end
  
  private
  
  def statement
    Statement.new(@transaction_history).generate_statement
  end
  ```
  
  - I added a feature test in `./spec/features/account_feature.rb`. My aim with this test is to run through all the interactions a user might have with their account in one test
  - I removed the first four tests from `account_spec.rb` as they were testing implementation rather than the behaviour a user would expect. I realise I often fall back on these sorts of tests in the early stages of a project when I'm a little unsure of how to proceed. Going forward, I will aim to write better tests that focus more on behaviour
  
  ## Still To Do
  
- Move the formatting responsabilities in transaction class to the statement class, which is where all other fromatting takes place
- Install Timecop and use it to freeze time for testing purposes, instead of stubbing as I have done
