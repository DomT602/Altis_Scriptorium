#define QUOTE(var1) #var1
#define GLUE(g1,g2) g1##g2
#define TF_RADIO_ID_full(baseClass,displayNameBase) class baseClass##_1 : baseClass \
    { \
        displayName = QUOTE(displayNameBase 1); \
        scope = 1; \
        scopeCurator = 1; \
        scopeArsenal = 1; \
        tf_prototype = 0; \
        tf_radio = 1; \
    };


#define TF_RADIO_IDS_1(baseClass,displayNameBase,index) class baseClass##_##index : baseClass##_1 \
{ \
    displayName = QUOTE(displayNameBase index); \
};

#define TF_RADIO_IDS_10(baseClass,displayNameBase,index10) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,0)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,1)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,2)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,3)3) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,4)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,5)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,6)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,7)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,8)) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,GLUE(index10,9))

#define TF_RADIO_IDS_100(baseClass,displayNameBase,index100) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,0)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,1)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,2)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,3)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,4)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,5)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,6)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,7)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,8)) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,GLUE(index100,9))


#define TF_RADIO_IDS_999(baseClass,displayNameBase) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,2) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,3) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,4) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,5) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,6) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,7) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,8) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,9) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,1) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,2) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,3) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,4) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,5) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,6) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,7) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,8) \
    TF_RADIO_IDS_10(baseClass,displayNameBase,9) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,1) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,2) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,3) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,4) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,5) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,6) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,7) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,8) \
    TF_RADIO_IDS_100(baseClass,displayNameBase,9) \
    TF_RADIO_IDS_1(baseClass,displayNameBase,1000)

#define TF_RADIO_IDS(baseClass,displayNameBase) \
    TF_RADIO_ID_full(baseClass,displayNameBase) \
    TF_RADIO_IDS_999(baseClass,displayNameBase)
