using System.Collections;
using System.Collections.Generic;
using Autodesk.Fbx;
using UnityEngine;

public class SpawnManager : MonoBehaviour
{
    public GameObject[] animalsPrefabs;
    public float range = 20;
    private float spawnTime = 2.0f;
    private float spawnRate = 2.0f;

    // Start is called before the first frame update
    void Start()
    {
        InvokeRepeating("SpawnRandomAnimals", spawnTime, spawnRate);
    }

    // Update is called once per frame
    void Update()
    {
    }

    void SpawnRandomAnimals()
    {
        int animalsIndex = Random.Range(0, animalsPrefabs.Length);
        Instantiate(animalsPrefabs[animalsIndex], new Vector3(Random.Range(-range, range), 0, 20), animalsPrefabs[animalsIndex].transform.rotation);

    }
}
