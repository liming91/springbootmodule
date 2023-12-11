package com.yb.manager.service.impl;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yb.manager.entity.Test;
import com.yb.manager.entity.vo.TestVO;
import com.yb.manager.service.TestService;
import com.yb.manager.mapper.TestMapper;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * @author Y
 * @description 针对表【test】的数据库操作Service实现
 * @createDate 2023-12-11 15:03:56
 */
@Service
public class TestServiceImpl extends ServiceImpl<TestMapper, Test>
        implements TestService {

    @Override
    public List<TestVO> getSevenDate() {
        List<String> sevenDate = getSevenDate(7);
        List<TestVO> dateList = this.baseMapper.getSevenDate();
        return radiationDataList(sevenDate, dateList);
    }

    private static List<TestVO> radiationDataList(List<String> sevenDate, List<TestVO> testList) {
        List<TestVO> resList = new ArrayList<>();
        for (String s : sevenDate) {
            TestVO testVO = new TestVO();
            testVO.setDate(s);
            boolean b = false;
            for (TestVO test : testList) {
                if (s.equals(test.getDate())) {
                    testVO.setMoney(test.getMoney());
                    resList.add(testVO);
                    b = true;
                    break;
                }
            }
            if (!b) {
                testVO.setMoney(0.0);
                resList.add(testVO);
            }
        }
        return resList;
    }


    /**
     * 最近7天数据
     *
     * @param day
     * @return
     */
    public static List<String> getSevenDate(int day) {
        List<String> dateList = new ArrayList<>();
        for (int i = 0; i < day; i++) {
            Date date = DateUtils.addDays(new Date(), -i);
            dateList.add(DateUtil.format(date, DatePattern.NORM_DATE_PATTERN));
        }
        Collections.sort(dateList);
        return dateList;
    }
}




