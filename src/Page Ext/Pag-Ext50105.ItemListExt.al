pageextension 50105 ItemListExt extends "Item List"
{
    actions
    {
        addfirst(processing)
        {
            action(setfilter)
            {
                Caption = 'Set Filter';
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction()
                begin


                end;

            }
        }
    }
}
