package cn.chen.config;

import cn.chen.aop.UserBehaviorAspect;
import cn.chen.dao.JedisDao;
import cn.chen.dao.mysql.QuestionDao;
import cn.chen.dao.mysql.UserDao;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
@Configuration
public class AspectConfig {
    @Bean
    public UserBehaviorAspect userBehaviorAspect(UserDao u, JedisDao jedisDao, QuestionDao questionDao) {
        return new UserBehaviorAspect(u, jedisDao, questionDao);
    }
}
