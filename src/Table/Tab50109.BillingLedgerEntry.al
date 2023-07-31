table 50109 BillingLedgerEntry
{
    Caption = 'BillingLedgerEntry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Document No."; Code[50])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;

        }
        field(3; "Item No."; Code[50])
        {
            Caption = 'Item No.';
            DataClassification = ToBeClassified;

        }
        field(4; Quantity; Integer)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;

        }
        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;

        }
        field(6; "Line Total"; Decimal)
        {
            Caption = 'Line Total';
            DataClassification = ToBeClassified;

        }
        field(18; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;

        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
