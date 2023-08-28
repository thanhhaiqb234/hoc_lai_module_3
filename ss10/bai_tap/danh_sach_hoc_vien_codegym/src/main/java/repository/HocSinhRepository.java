package repository;



import model.HocSinh;

import java.util.ArrayList;
import java.util.List;

public class HocSinhRepository implements IHocSinhRepository{
    private static List<HocSinh> hocSinhList = new ArrayList<>();
    static {
        hocSinhList.add(new HocSinh("001","Đinh Thanh Hải",true,90));
        hocSinhList.add(new HocSinh("002","Trương Thị Thúy Hằng",false,90));
        hocSinhList.add(new HocSinh("003","Lê Thị Yến Hoa",false,70));
        hocSinhList.add(new HocSinh("004","Phạm Quang Hưng",true,50));
        hocSinhList.add(new HocSinh("005","Trương Tấn Hải",true,40));
    }

    @Override
    public List<HocSinh> showList() {
        return hocSinhList;
    }
}
