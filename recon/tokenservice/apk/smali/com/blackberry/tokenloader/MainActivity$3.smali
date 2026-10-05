.class Lcom/blackberry/tokenloader/MainActivity$3;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blackberry/tokenloader/MainActivity;->LoadAndSelectTokens(Landroid/view/View;)Z
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
    .line 131
    iput-object p1, p0, Lcom/blackberry/tokenloader/MainActivity$3;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 135
    iget-object v3, p0, Lcom/blackberry/tokenloader/MainActivity$3;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    # invokes: Lcom/blackberry/tokenloader/MainActivity;->GetTokens()Ljava/lang/String;
    invoke-static {v3}, Lcom/blackberry/tokenloader/MainActivity;->access$100(Lcom/blackberry/tokenloader/MainActivity;)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "message":Ljava/lang/String;
    iget-object v3, p0, Lcom/blackberry/tokenloader/MainActivity$3;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    # getter for: Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;
    invoke-static {v3}, Lcom/blackberry/tokenloader/MainActivity;->access$200(Lcom/blackberry/tokenloader/MainActivity;)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 138
    iget-object v3, p0, Lcom/blackberry/tokenloader/MainActivity$3;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    # getter for: Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;
    invoke-static {v3}, Lcom/blackberry/tokenloader/MainActivity;->access$200(Lcom/blackberry/tokenloader/MainActivity;)Landroid/app/ProgressDialog;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/ProgressDialog;->dismiss()V

    .line 140
    :cond_1b
    const-string v3, "Successful"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_32

    .line 142
    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/blackberry/tokenloader/MainActivity$3;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    const-class v4, Lcom/blackberry/tokenloader/DisplayToken;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 143
    .local v0, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/blackberry/tokenloader/MainActivity$3;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    invoke-virtual {v3, v0}, Lcom/blackberry/tokenloader/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 148
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_31
    return-void

    .line 145
    :cond_32
    iget-object v3, p0, Lcom/blackberry/tokenloader/MainActivity$3;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    # getter for: Lcom/blackberry/tokenloader/MainActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v3}, Lcom/blackberry/tokenloader/MainActivity;->access$300(Lcom/blackberry/tokenloader/MainActivity;)Landroid/os/Handler;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 146
    .local v2, "msgToast":Landroid/os/Message;
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    goto :goto_31
.end method
