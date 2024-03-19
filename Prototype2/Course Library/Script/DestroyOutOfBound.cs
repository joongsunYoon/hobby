using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyOutOfBound : MonoBehaviour
{
    public float bounds = 20;
    private float cutline = -3;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (transform.position.z > bounds)
        {
            Destroy(gameObject);
        }
        else if (transform.position.z < cutline)
        {
            Debug.Log("Game Over");
            Destroy(gameObject);
        }

    }

}
