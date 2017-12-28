namespace java com.personali.rolloutThrift
namespace rb com.personali.rolloutThrift

service TRolloutThriftService{
    bool isActive(1:string feature)
    bool isActiveForUser(1:string feature, 2:string userId)
    void activate(1:string feature)
    void activatePercentage(1:string feature, 2:i32 percentage)
    TFeature get(1:string feature)
    list<TFeature> getAll()
    list<TFeature> getAllActive()
    list<TFeature> getAllActiveForUser(1:string userId)
    list<TFeature> multiGet(1:list<string> features)
    void deleteFeature(1:string feature)
    ;void activateGroup(1:string feature, 2:string group)
    ;void deactivateGroup(1:string feature, 2:string group)
}

struct TFeature{
    1: optional list<string> groups;
    2: optional list<string> users;
    3: optional i32 percentage;
    4: optional string data;
    5: optional string name;
    6: optional string options;
}
