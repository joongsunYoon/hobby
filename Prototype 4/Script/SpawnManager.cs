using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnManager : MonoBehaviour
{
    public GameObject enemy;
    private float spawnRange = 9;
    private int enemyCount;
    public int waveNumber = 1;
    public GameObject powerUpPrefabs;
    // Start is called before the first frame update
    void Start()
    {
        SpawnEnemy(waveNumber);
        Instantiate(powerUpPrefabs, SpawnRange(), powerUpPrefabs.transform.rotation);
    }

    // Update is called once per frame
    void Update()
    {
        enemyCount = FindObjectsOfType<Enemy>().Length;
        if (enemyCount == 0)
        {
            waveNumber++;
            SpawnEnemy(waveNumber);
            Instantiate(powerUpPrefabs, SpawnRange(), powerUpPrefabs.transform.rotation);
        }

    }

    void SpawnEnemy(int enemyCount)
    {
        for (int i = 0; i < enemyCount; i++)
        {
            Instantiate(enemy, SpawnRange(), enemy.transform.rotation);
        }
    }

    private Vector3 SpawnRange()
    {
        float spawnRangeX = Random.Range(-spawnRange, spawnRange);
        float spawnRangeZ = Random.Range(-spawnRange, spawnRange);
        Vector3 randomPos = new Vector3(spawnRangeX, 0, spawnRangeZ);
        return randomPos;
    }
}
