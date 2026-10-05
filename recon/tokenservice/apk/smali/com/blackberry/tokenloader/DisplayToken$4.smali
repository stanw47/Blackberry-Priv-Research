.class Lcom/blackberry/tokenloader/DisplayToken$4;
.super Ljava/lang/Object;
.source "DisplayToken.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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
    .line 94
    iput-object p1, p0, Lcom/blackberry/tokenloader/DisplayToken$4;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 98
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_12

    .line 99
    iget-object v0, p0, Lcom/blackberry/tokenloader/DisplayToken$4;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    # setter for: Lcom/blackberry/tokenloader/DisplayToken;->then:J
    invoke-static {v0, v2, v3}, Lcom/blackberry/tokenloader/DisplayToken;->access$302(Lcom/blackberry/tokenloader/DisplayToken;J)J

    .line 106
    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0

    .line 100
    :cond_12
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_10

    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v1, p0, Lcom/blackberry/tokenloader/DisplayToken$4;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    # getter for: Lcom/blackberry/tokenloader/DisplayToken;->then:J
    invoke-static {v1}, Lcom/blackberry/tokenloader/DisplayToken;->access$300(Lcom/blackberry/tokenloader/DisplayToken;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget-object v1, p0, Lcom/blackberry/tokenloader/DisplayToken$4;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    # getter for: Lcom/blackberry/tokenloader/DisplayToken;->longClickDuration:I
    invoke-static {v1}, Lcom/blackberry/tokenloader/DisplayToken;->access$400(Lcom/blackberry/tokenloader/DisplayToken;)I

    move-result v1

    int-to-long v4, v1

    cmp-long v1, v2, v4

    if-lez v1, :cond_10

    .line 102
    iget-object v1, p0, Lcom/blackberry/tokenloader/DisplayToken$4;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    iget-object v2, p0, Lcom/blackberry/tokenloader/DisplayToken$4;->this$0:Lcom/blackberry/tokenloader/DisplayToken;

    # getter for: Lcom/blackberry/tokenloader/DisplayToken;->sel_pos:I
    invoke-static {v2}, Lcom/blackberry/tokenloader/DisplayToken;->access$200(Lcom/blackberry/tokenloader/DisplayToken;)I

    move-result v2

    # invokes: Lcom/blackberry/tokenloader/DisplayToken;->displayDiscription(I)Z
    invoke-static {v1, v2}, Lcom/blackberry/tokenloader/DisplayToken;->access$500(Lcom/blackberry/tokenloader/DisplayToken;I)Z

    goto :goto_11
.end method
