.class public Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;
.super Ljava/lang/Object;
.source "TokenStorage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/blackberry/tokenloader/TokenStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "TokenRecord"
.end annotation


# instance fields
.field selected:Z

.field final synthetic this$0:Lcom/blackberry/tokenloader/TokenStorage;

.field token:[B

.field token_des:Ljava/lang/String;

.field token_name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/blackberry/tokenloader/TokenStorage;Ljava/lang/String;Ljava/lang/String;[BIZ)V
    .registers 8
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "token"    # [B
    .param p5, "size"    # I
    .param p6, "selected"    # Z

    .prologue
    .line 89
    iput-object p1, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->this$0:Lcom/blackberry/tokenloader/TokenStorage;

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    invoke-static {p4, p5}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    iput-object v0, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token:[B

    .line 92
    iput-object p2, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token_name:Ljava/lang/String;

    .line 93
    iput-object p3, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token_des:Ljava/lang/String;

    .line 94
    iput-boolean p6, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->selected:Z

    .line 95
    return-void
.end method


# virtual methods
.method public getToken()[B
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token:[B

    return-object v0
.end method

.method public getTokenName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token_name:Ljava/lang/String;

    return-object v0
.end method

.method public isSelected()Z
    .registers 2

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->selected:Z

    return v0
.end method
