.class Lcom/blackberry/tokenloader/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blackberry/tokenloader/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blackberry/tokenloader/MainActivity;


# direct methods
.method constructor <init>(Lcom/blackberry/tokenloader/MainActivity;)V
    .registers 2

    .prologue
    .line 73
    iput-object p1, p0, Lcom/blackberry/tokenloader/MainActivity$2;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0006

    if-ne v0, v1, :cond_e

    .line 76
    iget-object v0, p0, Lcom/blackberry/tokenloader/MainActivity$2;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    # invokes: Lcom/blackberry/tokenloader/MainActivity;->LoadAndSelectTokens(Landroid/view/View;)Z
    invoke-static {v0, p1}, Lcom/blackberry/tokenloader/MainActivity;->access$000(Lcom/blackberry/tokenloader/MainActivity;Landroid/view/View;)Z

    .line 78
    :cond_e
    return-void
.end method
