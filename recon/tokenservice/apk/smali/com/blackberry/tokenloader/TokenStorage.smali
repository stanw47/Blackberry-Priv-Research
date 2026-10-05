.class public Lcom/blackberry/tokenloader/TokenStorage;
.super Ljava/lang/Object;
.source "TokenStorage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;
    }
.end annotation


# static fields
.field private static final TOKEN_DESCRIPTION:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final mandatotary_tokens:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public token_list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    .line 23
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "hlos_signature.tkn"

    const-string v2, "Define accepted software signature type."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "ddt.tkn"

    const-string v2, "Enable privileged Blackberry Diagnostic and Telemetry system."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "perf_config.tkn"

    const-string v2, "Modify system performance parameters."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "adb_mode.tkn"

    const-string v2, "Automatically enable ADB interface."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "diag_mode.tkn"

    const-string v2, "Enable radio interface privileged access"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "bt_mode.tkn"

    const-string v2, "Enable bluetooth interface privileged access."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "nfc_mode.tkn"

    const-string v2, "Enabled NFC interface privileged access."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "wlan_mode.tkn"

    const-string v2, "Enable WiFi interface privileged access."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "omadm_mode.tkn"

    const-string v2, "Change OMADM default settings"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "power_mode.tkn"

    const-string v2, "Change charging priority."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "carrier_iq.tkn"

    const-string v2, "Enable carrier IQ services for testing."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "sw_rollback.tkn"

    const-string v2, "Override anti-rollback software protection mechanism."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "ecid.tkn"

    const-string v2, "Override carrier ID value."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "workapps.tkn"

    const-string v2, "Enable dialer to install apps to the work profile."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    const-string v1, "obdm.tkn"

    const-string v2, "Enable onboard device monitor."

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/blackberry/tokenloader/TokenStorage;->mandatotary_tokens:Ljava/util/List;

    .line 41
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->mandatotary_tokens:Ljava/util/List;

    const-string v1, "hlos_signature.tkn"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->mandatotary_tokens:Ljava/util/List;

    const-string v1, "ddt.tkn"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    .line 47
    iget-object v0, p0, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 48
    return-void
.end method


# virtual methods
.method public AddTokenRecord(Ljava/lang/String;[BI)V
    .registers 13
    .param p1, "token_name"    # Ljava/lang/String;
    .param p2, "token_record"    # [B
    .param p3, "size"    # I

    .prologue
    .line 55
    const/4 v6, 0x0

    .line 56
    .local v6, "selected":Z
    const/4 v3, 0x0

    .line 58
    .local v3, "token_des":Ljava/lang/String;
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "token_des":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 59
    .restart local v3    # "token_des":Ljava/lang/String;
    if-nez v3, :cond_d

    .line 71
    :goto_c
    return-void

    .line 64
    :cond_d
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_e
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->mandatotary_tokens:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v7, v0, :cond_26

    .line 65
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->mandatotary_tokens:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 66
    const/4 v6, 0x1

    .line 64
    :cond_23
    add-int/lit8 v7, v7, 0x1

    goto :goto_e

    .line 70
    :cond_26
    iget-object v8, p0, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    new-instance v0, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;-><init>(Lcom/blackberry/tokenloader/TokenStorage;Ljava/lang/String;Ljava/lang/String;[BIZ)V

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_c
.end method

.method public GetTokenList()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    sget-object v0, Lcom/blackberry/tokenloader/TokenStorage;->TOKEN_DESCRIPTION:Ljava/util/Map;

    return-object v0
.end method

.method public GetTokenNum()I
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public ResetTokenNum()V
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 80
    return-void
.end method
