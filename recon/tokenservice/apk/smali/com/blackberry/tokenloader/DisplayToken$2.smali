.class Lcom/blackberry/tokenloader/DisplayToken$2;
.super Ljava/lang/Object;
.source "DisplayToken.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blackberry/tokenloader/DisplayToken;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blackberry/tokenloader/DisplayToken;


# direct methods
.method constructor <init>(Lcom/blackberry/tokenloader/DisplayToken;)V
    .registers 2

    .prologue
    .line 81
    iput-object p1, p0, Lcom/blackberry/tokenloader/DisplayToken$2;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 8
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    sget-object v0, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    iget-object v0, v0, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    invoke-virtual {v0}, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 85
    iget-object v0, p0, Lcom/blackberry/tokenloader/DisplayToken$2;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    # getter for: Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/blackberry/tokenloader/DisplayToken;->access$100(Lcom/blackberry/tokenloader/DisplayToken;)Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p3, v1}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 86
    :cond_1a
    return-void
.end method
