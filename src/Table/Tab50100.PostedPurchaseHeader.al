table 50100 PostedPurchaseHeader
{
    Caption = 'PostedPurchaseHeader';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(3; "User ID"; Text[100])
        {
            Caption = 'User ID';
        }
        field(4; "Buy From Vendor"; Code[20])
        {
            Caption = 'Buy From Vendor';
        }
        field(12; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(5; Address; Text[200])
        {
            Caption = 'Address';
        }
        field(6; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
        }
        field(27; "Received By"; Code[20])
        {
            Caption = 'Received By';
        }
        field(99; "Amount After Tax"; Decimal)
        {
            Caption = 'Amount After Tax';
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
}
