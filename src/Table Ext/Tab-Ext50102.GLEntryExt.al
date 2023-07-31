tableextension 50102 GLEntryExt extends "G/L Entry"
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
        field(50102; "Tax Sum"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }
}
