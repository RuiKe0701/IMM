package team.ruike.imm.utility;

import java.io.Serializable;
import java.util.List;

public class Pager<T> implements Serializable {



    //每页显示多少条记录
    public int pageSize;
    //当前第几页数据
    public int currentPage;
    //一共有多少条记录
    private int totalRecord;
    //一共多少页记录
    private int totalPage;
    //要显示的数据，使用泛型
    private List<T> dataList;

    public Pager() {
        super();
    }


    public Pager(int pageSize, int currentPage, int totalRecord, int totalPage, List<T> dataList) {
        super();
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.totalRecord = totalRecord;
        this.totalPage = totalPage;
        this.dataList = dataList;
    }

    public Pager(int pageNum, int pageSize, List<T> sourceList){
        if (sourceList == null){
            return;
        }
       
        //�ܼ�¼����
        this.totalRecord = sourceList.size();
        //ÿҳ��ʾ��������¼
        this.pageSize = pageSize;
        //��ȡ��ҳ��
        this.totalPage = this.totalRecord / this.pageSize;
        if (this.totalRecord % this.pageSize != 0) {
            this.totalPage += 1;
        }

        //��ǰ�ڼ�ҳ����
        this.currentPage = this.totalPage < pageNum ? this.totalPage : pageNum;

        //��ʼ����
        int fromIndex = this.pageSize * (this.currentPage - 1);
        //��������
        int toIndex =this.pageSize * this.currentPage > this.totalRecord ?  this.totalRecord :  this.pageSize * this.currentPage;

        this.dataList = sourceList.subList(fromIndex, toIndex);
    }

    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getCurrentPage() {
        return currentPage;
    }
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }
    public int getTotalRecord() {
        return totalRecord;
    }
    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }
    public int getTotalPage() {
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public List<T> getDataList() {
        return dataList;
    }
    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }
}
