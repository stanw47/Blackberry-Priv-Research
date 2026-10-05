.class Lcom/blackberry/tokenloader/DisplayToken$3;
.super Ljava/lang/Object;
.source "DisplayToken.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


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
    .line 88
    iput-object p1, p0, Lcom/blackberry/tokenloader/DisplayToken$3;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .registers 7
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 90
    iget-object v0, p0, Lcom/blackberry/tokenloader/DisplayToken$3;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    # setter for: Lcom/blackberry/tokenloader/DisplayToken;->sel_pos:I
    invoke-static {v0, p3}, Lcom/blackberry/tokenloader/DisplayToken;->access$202(Lcom/blackberry/tokenloader/DisplayToken;I)I

    .line 91
    const/4 v0, 0x0

    return v0
.end method
