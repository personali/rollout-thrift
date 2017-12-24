namespace java com.personali.rolloutThrift
namespace rb com.personali.rolloutThrift

service RolloutThriftService{
    bool isActive(1:string feature)
    void activate(1:string feature)
}
