package team.runke.imm.entity;
/**
 *　@author 索志文
 *　@versrion 1.0
 * 活动详情
 */
public class EventDetails {
    /**
     * 活动编号
     */
    private Integer eventDetailsId;
    /**
     * 活动详情
     */
    private String eventDetailsName;

    public Integer getEventDetailsId() {
        return eventDetailsId;
    }

    public void setEventDetailsId(Integer eventDetailsId) {
        this.eventDetailsId = eventDetailsId;
    }

    public String getEventDetailsName() {
        return eventDetailsName;
    }

    public void setEventDetailsName(String eventDetailsName) {
        this.eventDetailsName = eventDetailsName;
    }
}
