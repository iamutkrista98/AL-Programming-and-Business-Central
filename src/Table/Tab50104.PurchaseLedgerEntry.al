table 50104 "Purchase Ledger Entry"
{
    Caption = 'Purchase Ledger Entry';
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
        field(18; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
}
