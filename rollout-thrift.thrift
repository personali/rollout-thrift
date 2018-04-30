namespace java com.personali.rolloutThrift
namespace rb com.personali.rolloutThrift

struct TFeature{
    1: optional list<string> groups;
    2: optional list<string> users;
    3: optional i32 percentage;
    4: optional string data;
    5: optional string name;
    6: optional string options;
}

exception TRolloutThriftServiceException {
    1:string message
}

service TRolloutThriftService{
    bool isActive(1:string feature) throws (1:TRolloutThriftServiceException e)
    bool isActiveForUser(1:string feature, 2:string userId) throws (1:TRolloutThriftServiceException e)
    void activate(1:string feature) throws (1:TRolloutThriftServiceException e)
    void deactivate(1:string feature) throws (1:TRolloutThriftServiceException e)
    void activateUser(1:string feature, 2:string userId) throws (1:TRolloutThriftServiceException e)
    void deactivateUser(1:string feature, 2:string userId) throws (1:TRolloutThriftServiceException e)
    void activatePercentage(1:string feature, 2:i32 percentage) throws (1:TRolloutThriftServiceException e)
    void deactivatePercentage(1:string feature) throws (1:TRolloutThriftServiceException e)
    TFeature get(1:string feature) throws (1:TRolloutThriftServiceException e)
    list<TFeature> getAll() throws (1:TRolloutThriftServiceException e)
    list<TFeature> getAllActive() throws (1:TRolloutThriftServiceException e)
    list<TFeature> getAllActiveForUser(1:string userId) throws (1:TRolloutThriftServiceException e)
    list<TFeature> multiGet(1:list<string> features) throws (1:TRolloutThriftServiceException e)
    void deleteFeature(1:string feature) throws (1:TRolloutThriftServiceException e)
    void activateGroup(1:string feature, 2:string group) throws (1:TRolloutThriftServiceException e)
    void deactivateGroup(1:string feature, 2:string group) throws (1:TRolloutThriftServiceException e)
}