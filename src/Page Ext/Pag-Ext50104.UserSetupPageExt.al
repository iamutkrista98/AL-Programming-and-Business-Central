pageextension 50104 UserSetupPageExt extends "User Setup"
{
    layout
    {
        addafter("Allow Posting From")
        {
            field("Allow Posting"; Rec."Allow Posting")
            {
                ApplicationArea = All;

            }
        }
    }
}
