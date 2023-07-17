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

        }
    }


}
