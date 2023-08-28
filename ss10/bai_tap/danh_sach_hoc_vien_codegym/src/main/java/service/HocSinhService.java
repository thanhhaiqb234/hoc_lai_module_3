package service;

import model.HocSinh;
import repository.HocSinhRepository;
import repository.IHocSinhRepository;

import java.awt.*;
import java.util.List;

public class HocSinhService implements IHocSinhService{
    private static IHocSinhRepository hocSinhRepository = new HocSinhRepository();

    @Override
    public List<HocSinh> showList() {
        return hocSinhRepository.showList();
    }
}
