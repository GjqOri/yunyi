package cn.chen.dao;

import cn.chen.config.RootConfig;
import cn.chen.dao.mysql.FileDao;
import cn.chen.model.File;
import cn.chen.model.User;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

public class FIleDaoTest {
    @Test
    public void test1() {
        AnnotationConfigApplicationContext annotationConfigApplicationContext = new AnnotationConfigApplicationContext(RootConfig.class);
        FileDao fileDao = annotationConfigApplicationContext.getBean(FileDao.class);
        /*File file = new File();
        file.setMd5("1");
        file.setFileName("1");
        file.setFileDetail("1");
        User user = new User();
        user.setId(1);
        file.setUploader(user);*/
        List<File> files = fileDao.getFiles();

        System.out.println();
    }
}
