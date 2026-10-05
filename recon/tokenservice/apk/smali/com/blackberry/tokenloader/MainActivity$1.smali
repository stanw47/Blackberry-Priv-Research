.class Lcom/blackberry/tokenloader/MainActivity$1;
.super Landroid/os/Handler;
.source "MainActivity.java"


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
.method constructor <init>(Lcom/blackberry/tokenloader/MainActivity;Landroid/os/Looper;)V
    .registers 3
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/blackberry/tokenloader/MainActivity$1;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 6
    .param p1, "inputMessage"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 64
    iget-object v1, p0, Lcom/blackberry/tokenloader/MainActivity$1;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    invoke-virtual {v1}, Lcom/blackberry/tokenloader/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-static {v2, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 65
    .local v0, "toast":Landroid/widget/Toast;
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v3, v3}, Landroid/widget/Toast;->setGravity(III)V

    .line 66
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 67
    return-void
.end method
