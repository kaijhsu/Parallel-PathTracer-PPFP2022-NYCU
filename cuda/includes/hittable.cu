#ifndef HITTABLE_H
#define HITTABLE_H

#include "ray.cu"

class material;

struct hit_record {
    point3 p;
    vec3 normal;
    float t;
    material *mat_ptr;
    bool front_face;

    __device__
    inline void set_face_normal(const ray& r, const vec3& outward_normal) {
        front_face = dot(r.direction(), outward_normal) < 0;
        normal = front_face ? outward_normal :-outward_normal;
    }
};

class hittable {
    public:
        __device__
        virtual bool hit(const ray& r, const float& t_min, const float &t_max, hit_record& rec) const = 0;
};

#endif