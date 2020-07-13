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


## Initial Domain Model

<p align="center">
<img src=/images/domain_model_for_bank_challenge.png width=80%>
</p> 

