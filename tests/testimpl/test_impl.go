package testimpl

import (
	"context"
	"strconv"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/elasticache"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	awsClient := GetAWSElasticacheClient(t)

	t.Run("TestElasticacheClusterIsDeployed", func(t *testing.T) {
		cacheClusterId := terraform.Output(t, ctx.TerratestTerraformOptions(), "elasticache_cluster_id")
		arn := terraform.Output(t, ctx.TerratestTerraformOptions(), "elasticache_cluster_arn")
		engine := terraform.Output(t, ctx.TerratestTerraformOptions(), "elasticache_cluster_engine")

		clusters, err := awsClient.DescribeCacheClusters(context.TODO(), &elasticache.DescribeCacheClustersInput{
			CacheClusterId: &cacheClusterId,
		})

		if err != nil {
			t.Errorf("Failure during DescribeCacheClusters: %v", err)
		}

		assert.Equal(t, *clusters.CacheClusters[0].ARN, arn, "Expected ARN did not match actual ARN!")
		assert.Equal(t, *clusters.CacheClusters[0].Engine, engine, "Expected Engine did not match actual Engine!")
	})

	t.Run("TestElasticacheClusterIsAvailable", func(t *testing.T) {
		cacheClusterId := terraform.Output(t, ctx.TerratestTerraformOptions(), "elasticache_cluster_id")

		clusters, err := awsClient.DescribeCacheClusters(context.TODO(), &elasticache.DescribeCacheClustersInput{
			CacheClusterId: &cacheClusterId,
		})

		if err != nil {
			t.Errorf("Failure during DescribeCacheClusters: %v", err)
		}

		assert.Equal(t, *clusters.CacheClusters[0].CacheClusterStatus, "available", "Cluster is not available!")
	})

	t.Run("TestElasticacheClusterDeployedCacheNodes", func(t *testing.T) {
		cacheClusterId := terraform.Output(t, ctx.TerratestTerraformOptions(), "elasticache_cluster_id")
		cacheNodes, _ := strconv.Atoi(terraform.Output(t, ctx.TerratestTerraformOptions(), "elasticache_cluster_num_cache_nodes"))

		clusters, err := awsClient.DescribeCacheClusters(context.TODO(), &elasticache.DescribeCacheClustersInput{
			CacheClusterId: &cacheClusterId,
		})

		if err != nil {
			t.Errorf("Failure during DescribeCacheClusters: %v", err)
		}

		assert.Equal(t, int(*clusters.CacheClusters[0].NumCacheNodes), cacheNodes, "Expected num cache nodes does not match actual num cache nodes!")
	})
}

func GetAWSElasticacheClient(t *testing.T) *elasticache.Client {
	awsElasticacheClient := elasticache.NewFromConfig(GetAWSConfig(t))
	return awsElasticacheClient
}

func GetAWSConfig(t *testing.T) (cfg aws.Config) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	require.NoErrorf(t, err, "unable to load SDK config, %v", err)
	return cfg
}
