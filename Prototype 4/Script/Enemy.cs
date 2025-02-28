using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    public float speed = 0.5f;
    private GameObject player;
    private Rigidbody enemyRb;

    // Start is called before the first frame update
    void Start()
    {
        enemyRb = GetComponent<Rigidbody>();
        player = GameObject.Find("Player");
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 lookDirection = player.transform.position - transform.position;
        enemyRb.AddForce(lookDirection.normalized * speed);
        if (transform.position.y < -30)
        {
            Destroy(gameObject);
        }
    }
}
