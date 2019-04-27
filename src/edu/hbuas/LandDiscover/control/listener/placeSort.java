package edu.hbuas.LandDiscover.control.listener;

import edu.hbuas.LandDiscover.model.javaBean.Place;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

//价格升序
public class placeSort {

    public placeSort() {
    }
    public List<Place> SortByPrice(List<Place> Places){
        Collections.sort(Places, new Comparator<Place>(){
            @Override
            public int compare(Place o1, Place o2) {
                int i = o1.getPrice() - o2.getPrice();
                return i;
            }
        });
        return Places;
    }

//评级降序
    public List<Place> SortByGrade(List<Place> Places){
        Collections.sort(Places, new Comparator<Place>(){
            @Override
            public int compare(Place o1, Place o2) {
                int i = o2.getGrade() - o1.getGrade();
                return i;
            }
        });
        return Places;
    }

}
