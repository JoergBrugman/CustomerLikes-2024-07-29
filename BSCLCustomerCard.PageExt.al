pageextension 50201 "BSCL Customer Card" extends "Customer Card"
{
    actions
    {
        addlast(Category_Category9)
        {
            actionref(BSCLFavoriteBookCard_Promoted; "BSCL FavoriteBookCard") { }
        }

        addlast(navigation)
        {
            action("BSCL FavoriteBookCard")
            {
                Caption = 'Book Card';
                ApplicationArea = All;
                Image = Card;
                ToolTip = 'Executes the Book Card action.';
                Enabled = Rec."BSB Favorite Book No." <> '';
                // Promoted = true;
                // PromotedCategory = Process;
                // PromotedIsBig = true;
                // PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.ShowFavoriteBook();
                end;
            }
        }
    }
}