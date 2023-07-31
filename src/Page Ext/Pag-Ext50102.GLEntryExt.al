pageextension 50102 "G/LEntryExt" extends "G/L Entries Preview"
{
    layout
    {
        addafter(Amount)
        {
            field("TDS Amount"; Rec."TDS Amount")
            {
                ApplicationArea = All;


            }
            field("Training"; Rec.Training)
            {

            }
            field("Tax Sum"; Rec."Tax Sum")
            {

            }

        }
    }


}
