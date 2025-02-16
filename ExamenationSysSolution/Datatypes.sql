/*
Documentation: Password Data Type and Rule

Description:
    This script creates a custom data type `[Password]` for storing passwords in a secure format.
    It also defines a rule `Pass_Rule` to enforce a length constraint of exactly 20 characters on this data type.

Steps:
    1. Create a user-defined data type `[Password]` derived from `VARCHAR(20)`.
    2. Define a rule `Pass_Rule` that ensures the password length is exactly 20 characters.
    3. Bind the rule `Pass_Rule` to the `[Password]` data type to enforce validation.

Usage:
    - This custom data type can be used in table columns where password storage is needed.
    - Example:
        ```sql
        CREATE TABLE Users (
            UserID INT PRIMARY KEY,
            Username VARCHAR(50) NOT NULL,
            UserPassword [Password] -- Enforced by Pass_Rule
        );
*/
--Create Datatype for Password
Create Type [Password] from  varchar(20)Not Null
GO
Create Rule Pass_Rules as len(@password) <20
GO
Sp_Bindrule Pass_Rules ,'[Password]'
Go
drop Type [Password]
--------------------------------------------------------------