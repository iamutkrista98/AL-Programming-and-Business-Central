table 50107 PostedBillingHeader
{
    Caption = 'PostedBillingHeader';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Customer,Employee;
        }
        field(5; "Sell to Customer"; Code[20])
        {
            Caption = 'Sell to Customer';

        }
        field(6; "User ID"; Code[30])
        {
            Caption = 'User ID';
        }
        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';

        }
        field(8; "billno"; Code[20])
        {


        }
        field(9; "Customer Name"; Text[100])
        {

        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
