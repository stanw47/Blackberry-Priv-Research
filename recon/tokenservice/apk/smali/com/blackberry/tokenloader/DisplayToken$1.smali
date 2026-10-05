.class Lcom/blackberry/tokenloader/DisplayToken$1;
.super Ljava/lang/Object;
.source "DisplayToken.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 72
    iput-object p1, p0, Lcom/blackberry/tokenloader/DisplayToken$1;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a000a

    if-ne v0, v1, :cond_e

    .line 75
    iget-object v0, p0, Lcom/blackberry/tokenloader/DisplayToken$1;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    # invokes: Lcom/blackberry/tokenloader/DisplayToken;->SaveTokenInNV(Landroid/view/View;)Z
    invoke-static {v0, p1}, Lcom/blackberry/tokenloader/DisplayToken;->access$000(Lcom/blackberry/tokenloader/DisplayToken;Landroid/view/View;)Z

    .line 77
    :cond_e
    return-void
.end method
