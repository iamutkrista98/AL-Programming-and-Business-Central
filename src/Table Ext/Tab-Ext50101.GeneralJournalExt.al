tableextension 50101 GeneralJournalExt extends "Gen. Journal Line"
{
    fields
    {
        field(50100; "TDS Amount"; Decimal)
        {
            Caption = 'TDS Amount';
            DataClassification = ToBeClassified;
        }
        field(50101; "Training"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Sum of Tax"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
