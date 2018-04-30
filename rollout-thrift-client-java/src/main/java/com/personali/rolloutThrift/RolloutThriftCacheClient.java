package com.personali.rolloutThrift;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import org.apache.thrift.TException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

public class RolloutThriftCacheClient implements TRolloutThriftService.Iface {

    static final Logger logger = LoggerFactory.getLogger(RolloutThriftCacheClient.class);

    private String host;

    public RolloutThriftCacheClient(String host) {
        this.host = host;
    }

    private final Cache<String, List<TFeature>> rolloutResponseCache = CacheBuilder.newBuilder()
            .expireAfterAccess(5, TimeUnit.MINUTES)
            .weakKeys()
            .build();

    /**
     * private method to construct the key using for cache
     *
     * @param userId
     * @return
     */
    private String createRollOutCacheKey(String userId) {
        return userId + "_KEY";
    }

    public boolean isActive(String feature) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        return client.isActive(feature);
    }

    public boolean isActiveForUser(String feature, String userId) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        return client.isActiveForUser(feature, userId);
    }

    public void activate(String feature) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        client.activate(feature);
    }

    public void deactivate(String feature) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        client.deactivate(feature);
    }

    public void activateUser(String feature, String userId) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        client.activateUser(feature, userId);
    }

    public void deactivateUser(String feature, String userId) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        client.deactivateUser(feature, userId);
    }

    public void activatePercentage(String feature, int percentage) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        client.activatePercentage(feature, percentage);
    }

    public void deactivatePercentage(String feature) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        client.deactivatePercentage(feature);
    }

    public TFeature get(String feature) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        return client.get(feature);
    }

    public List<TFeature> getAll() throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        return client.getAll();
    }

    public List<TFeature> getAllActive() throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        return client.getAllActive();
    }

    public List<TFeature> getAllActiveForUser(final String userId) throws TRolloutThriftServiceException, TException {
        final TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        String key = createRollOutCacheKey(userId);

        try {
            return rolloutResponseCache.get(key, new Callable<List<TFeature>>() {
                public List<TFeature> call() throws Exception {
                    return client.getAllActiveForUser(userId);
                }
            });
        } catch (Exception e) {
            String message = "Error get response from rollout cache for user: " + userId;
            logger.error(message, e);
            throw new TRolloutThriftServiceException(message);
        }

    }

    public List<TFeature> multiGet(List<String> features) throws TRolloutThriftServiceException, TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(host);
        return client.multiGet(features);
    }

    public void deleteFeature(String feature) throws TRolloutThriftServiceException, TException {

    }

    public void activateGroup(String feature, String group) throws TRolloutThriftServiceException, TException {

    }

    public void deactivateGroup(String feature, String group) throws TRolloutThriftServiceException, TException {

    }
}
