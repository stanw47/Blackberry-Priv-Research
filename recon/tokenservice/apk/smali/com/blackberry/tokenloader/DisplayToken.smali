.class public Lcom/blackberry/tokenloader/DisplayToken;
.super Landroid/app/Activity;
.source "DisplayToken.java"


# static fields
.field public static token_storage:Lcom/blackberry/tokenloader/TokenStorage;


# instance fields
.field private listView:Landroid/widget/ListView;

.field private listview_adapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private longClickDuration:I

.field private sel_pos:I

.field private then:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    new-instance v0, Lcom/blackberry/tokenloader/TokenStorage;

    invoke-direct {v0}, Lcom/blackberry/tokenloader/TokenStorage;-><init>()V

    sput-object v0, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 33
    const/16 v0, 0x384

    iput v0, p0, Lcom/blackberry/tokenloader/DisplayToken;->longClickDuration:I

    return-void
.end method

.method private SaveTokenInNV(Landroid/view/View;)Z
    .registers 14
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v11, 0x7f07000a

    const/4 v8, 0x0

    .line 138
    const-string v7, "TokenLoader"

    const-string v9, "Save Token"

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    iget-object v7, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    invoke-virtual {v7}, Landroid/widget/ListView;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v5

    .line 141
    .local v5, "selected_tokens":Landroid/util/SparseBooleanArray;
    const-string v7, "TokenService"

    invoke-static {v7}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v7

    invoke-static {v7}, Lcom/blackberry/tokenservice/ITokenService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/blackberry/tokenservice/ITokenService;

    move-result-object v3

    .line 145
    .local v3, "om":Lcom/blackberry/tokenservice/ITokenService;
    :try_start_1b
    invoke-interface {v3}, Lcom/blackberry/tokenservice/ITokenService;->eraseDebugTokens()I

    move-result v4

    .line 146
    .local v4, "ret":I
    if-gtz v4, :cond_6d

    .line 147
    const-string v7, "TokenLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Token service access failed (erase):"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    invoke-virtual {p0}, Lcom/blackberry/tokenloader/DisplayToken;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    const-string v9, "Unable to access the token service(erase)"

    const/4 v10, 0x0

    invoke-static {v7, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_4b} :catch_4d

    move v7, v8

    .line 193
    .end local v4    # "ret":I
    :goto_4c
    return v7

    .line 152
    :catch_4d
    move-exception v1

    .line 153
    .local v1, "e":Ljava/lang/Exception;
    const-string v7, "TokenLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "FAILED to call service. Exception: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 156
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_6d
    if-eqz v5, :cond_12a

    .line 158
    iget-object v7, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    invoke-virtual {v7}, Landroid/widget/ListView;->getCount()I

    move-result v0

    .line 159
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_76
    if-ge v2, v0, :cond_12a

    .line 160
    invoke-virtual {v5, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v7

    if-eqz v7, :cond_126

    .line 161
    const-string v9, "TokenLoader"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Selected item: "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5, v2}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v7, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    iget-object v7, v7, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    invoke-virtual {v7}, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->getTokenName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " Size: "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v7, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    iget-object v7, v7, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    invoke-virtual {v7}, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->getToken()[B

    move-result-object v7

    array-length v7, v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    :try_start_c5
    sget-object v7, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    iget-object v7, v7, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    invoke-virtual {v7}, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->getToken()[B

    move-result-object v7

    invoke-interface {v3, v7}, Lcom/blackberry/tokenservice/ITokenService;->writeToken([B)I

    move-result v4

    .line 165
    .restart local v4    # "ret":I
    if-gtz v4, :cond_126

    .line 166
    const-string v7, "TokenLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Token service access failed (write):"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-virtual {p0}, Lcom/blackberry/tokenloader/DisplayToken;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    const-string v9, "Unable to access the token service(write)"

    const/4 v10, 0x0

    invoke-static {v7, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V
    :try_end_103
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_103} :catch_106

    move v7, v8

    .line 168
    goto/16 :goto_4c

    .line 170
    .end local v4    # "ret":I
    :catch_106
    move-exception v1

    .line 171
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v7, "TokenLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "FAILED to call service. Exception: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 159
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_126
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_76

    .line 178
    .end local v0    # "count":I
    .end local v2    # "i":I
    :cond_12a
    invoke-virtual {p0}, Lcom/blackberry/tokenloader/DisplayToken;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v11, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 179
    invoke-virtual {p0}, Lcom/blackberry/tokenloader/DisplayToken;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v11, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 180
    new-instance v6, Lcom/blackberry/tokenloader/DisplayToken$6;

    invoke-direct {v6, p0}, Lcom/blackberry/tokenloader/DisplayToken$6;-><init>(Lcom/blackberry/tokenloader/DisplayToken;)V

    .line 191
    .local v6, "timer":Ljava/lang/Thread;
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 193
    const/4 v7, 0x1

    goto/16 :goto_4c
.end method

.method static synthetic access$000(Lcom/blackberry/tokenloader/DisplayToken;Landroid/view/View;)Z
    .registers 3
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/blackberry/tokenloader/DisplayToken;->SaveTokenInNV(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/blackberry/tokenloader/DisplayToken;)Landroid/widget/ListView;
    .registers 2
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/blackberry/tokenloader/DisplayToken;)I
    .registers 2
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;

    .prologue
    .line 26
    iget v0, p0, Lcom/blackberry/tokenloader/DisplayToken;->sel_pos:I

    return v0
.end method

.method static synthetic access$202(Lcom/blackberry/tokenloader/DisplayToken;I)I
    .registers 2
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;
    .param p1, "x1"    # I

    .prologue
    .line 26
    iput p1, p0, Lcom/blackberry/tokenloader/DisplayToken;->sel_pos:I

    return p1
.end method

.method static synthetic access$300(Lcom/blackberry/tokenloader/DisplayToken;)J
    .registers 3
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/blackberry/tokenloader/DisplayToken;->then:J

    return-wide v0
.end method

.method static synthetic access$302(Lcom/blackberry/tokenloader/DisplayToken;J)J
    .registers 4
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;
    .param p1, "x1"    # J

    .prologue
    .line 26
    iput-wide p1, p0, Lcom/blackberry/tokenloader/DisplayToken;->then:J

    return-wide p1
.end method

.method static synthetic access$400(Lcom/blackberry/tokenloader/DisplayToken;)I
    .registers 2
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;

    .prologue
    .line 26
    iget v0, p0, Lcom/blackberry/tokenloader/DisplayToken;->longClickDuration:I

    return v0
.end method

.method static synthetic access$500(Lcom/blackberry/tokenloader/DisplayToken;I)Z
    .registers 3
    .param p0, "x0"    # Lcom/blackberry/tokenloader/DisplayToken;
    .param p1, "x1"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/blackberry/tokenloader/DisplayToken;->displayDiscription(I)Z

    move-result v0

    return v0
.end method

.method private displayDiscription(I)Z
    .registers 11
    .param p1, "position"    # I

    .prologue
    const/16 v8, 0xa

    .line 115
    sget-object v6, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    iget-object v6, v6, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    iget-object v4, v6, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token_name:Ljava/lang/String;

    .line 116
    .local v4, "nmToken":Ljava/lang/String;
    sget-object v6, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    iget-object v6, v6, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    iget-object v1, v6, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token_des:Ljava/lang/String;

    .line 117
    .local v1, "desToken":Ljava/lang/String;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 119
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0}, Lcom/blackberry/tokenloader/DisplayToken;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    .line 120
    .local v3, "inflater":Landroid/view/LayoutInflater;
    const v6, 0x7f040002

    const/4 v7, 0x0

    invoke-virtual {v3, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 121
    .local v2, "diaView":Landroid/view/View;
    const v6, 0x7f0a0007

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 122
    .local v5, "tvDes":Landroid/widget/TextView;
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 123
    const/high16 v6, 0x41900000    # 18.0f

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 124
    const/16 v6, 0x32

    const/16 v7, 0x1e

    invoke-virtual {v5, v6, v7, v8, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 125
    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setLines(I)V

    .line 126
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f070004

    new-instance v8, Lcom/blackberry/tokenloader/DisplayToken$5;

    invoke-direct {v8, p0}, Lcom/blackberry/tokenloader/DisplayToken$5;-><init>(Lcom/blackberry/tokenloader/DisplayToken;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 132
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 134
    const/4 v6, 0x1

    return v6
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    .line 44
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 45
    const v3, 0x7f040003

    invoke-virtual {p0, v3}, Lcom/blackberry/tokenloader/DisplayToken;->setContentView(I)V

    .line 48
    sget-object v3, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    invoke-virtual {v3}, Lcom/blackberry/tokenloader/TokenStorage;->GetTokenNum()I

    move-result v3

    new-array v2, v3, [Ljava/lang/String;

    .line 49
    .local v2, "token_name_list":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    sget-object v3, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    invoke-virtual {v3}, Lcom/blackberry/tokenloader/TokenStorage;->GetTokenNum()I

    move-result v3

    if-ge v1, v3, :cond_2c

    .line 50
    sget-object v3, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    iget-object v3, v3, Lcom/blackberry/tokenloader/TokenStorage;->token_list:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;

    iget-object v3, v3, Lcom/blackberry/tokenloader/TokenStorage$TokenRecord;->token_name:Ljava/lang/String;

    aput-object v3, v2, v1

    .line 49
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 54
    :cond_2c
    const v3, 0x7f0a000c

    invoke-virtual {p0, v3}, Lcom/blackberry/tokenloader/DisplayToken;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    iput-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    .line 55
    iget-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 56
    new-instance v3, Landroid/widget/ArrayAdapter;

    const v4, 0x1090005

    const v5, 0x1020014

    invoke-direct {v3, p0, v4, v5, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II[Ljava/lang/Object;)V

    iput-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listview_adapter:Landroid/widget/ArrayAdapter;

    .line 60
    iget-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    invoke-virtual {v3, v6}, Landroid/widget/ListView;->setTextFilterEnabled(Z)V

    .line 63
    iget-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/blackberry/tokenloader/DisplayToken;->listview_adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 65
    const/4 v1, 0x0

    :goto_59
    sget-object v3, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    invoke-virtual {v3}, Lcom/blackberry/tokenloader/TokenStorage;->GetTokenNum()I

    move-result v3

    if-ge v1, v3, :cond_69

    .line 67
    iget-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    invoke-virtual {v3, v1, v6}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_59

    .line 71
    :cond_69
    const v3, 0x7f0a000a

    invoke-virtual {p0, v3}, Lcom/blackberry/tokenloader/DisplayToken;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 72
    .local v0, "buttonCre":Landroid/widget/Button;
    new-instance v3, Lcom/blackberry/tokenloader/DisplayToken$1;

    invoke-direct {v3, p0}, Lcom/blackberry/tokenloader/DisplayToken$1;-><init>(Lcom/blackberry/tokenloader/DisplayToken;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    iget-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    new-instance v4, Lcom/blackberry/tokenloader/DisplayToken$2;

    invoke-direct {v4, p0}, Lcom/blackberry/tokenloader/DisplayToken$2;-><init>(Lcom/blackberry/tokenloader/DisplayToken;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 88
    iget-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    new-instance v4, Lcom/blackberry/tokenloader/DisplayToken$3;

    invoke-direct {v4, p0}, Lcom/blackberry/tokenloader/DisplayToken$3;-><init>(Lcom/blackberry/tokenloader/DisplayToken;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 94
    iget-object v3, p0, Lcom/blackberry/tokenloader/DisplayToken;->listView:Landroid/widget/ListView;

    new-instance v4, Lcom/blackberry/tokenloader/DisplayToken$4;

    invoke-direct {v4, p0}, Lcom/blackberry/tokenloader/DisplayToken$4;-><init>(Lcom/blackberry/tokenloader/DisplayToken;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 110
    return-void
.end method

.method protected onResume()V
    .registers 1

    .prologue
    .line 38
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 40
    return-void
.end method
