.class Lcom/blackberry/tokenloader/DisplayToken$6;
.super Ljava/lang/Thread;
.source "DisplayToken.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blackberry/tokenloader/DisplayToken;->SaveTokenInNV(Landroid/view/View;)Z
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
    .line 180
    iput-object p1, p0, Lcom/blackberry/tokenloader/DisplayToken$6;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 183
    const-wide/16 v2, 0x1388

    :try_start_2
    invoke-static {v2, v3}, Lcom/blackberry/tokenloader/DisplayToken$6;->sleep(J)V

    .line 184
    sget-object v1, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    invoke-virtual {v1}, Lcom/blackberry/tokenloader/TokenStorage;->ResetTokenNum()V

    .line 185
    iget-object v1, p0, Lcom/blackberry/tokenloader/DisplayToken$6;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    invoke-virtual {v1}, Lcom/blackberry/tokenloader/DisplayToken;->finish()V
    :try_end_f
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_f} :catch_10

    .line 189
    :goto_f
    return-void

    .line 186
    :catch_10
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_f
.end method
