.class Lcom/blackberry/tokenloader/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/blackberry/tokenloader/MainActivity;->ShowAbout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/blackberry/tokenloader/MainActivity;

.field final synthetic val$dialog:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Lcom/blackberry/tokenloader/MainActivity;Landroid/app/Dialog;)V
    .registers 3

    .prologue
    .line 321
    iput-object p1, p0, Lcom/blackberry/tokenloader/MainActivity$4;->this$0:Lcom/blackberry/tokenloader/MainActivity;

    iput-object p2, p0, Lcom/blackberry/tokenloader/MainActivity$4;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 324
    iget-object v0, p0, Lcom/blackberry/tokenloader/MainActivity$4;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 325
    return-void
.end method
